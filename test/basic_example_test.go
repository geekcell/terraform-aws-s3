package test

import (
	"os"
	"testing"

	TTAWS "github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"

	"github.com/stretchr/testify/assert"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/s3"
)

func TestTerraformBasicExample(t *testing.T) {
	bucketName := "test-" + GetShortId()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/basic-example",
		Vars: map[string]interface{}{
			"name": bucketName,
		},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	id := terraform.Output(t, terraformOptions, "id")
	assert.NotEmpty(t, id)

	arn := terraform.Output(t, terraformOptions, "arn")
	assert.NotEmpty(t, arn)

	sess, err := NewSession(os.Getenv("AWS_REGION"))
	assert.NoError(t, err)

	s3Client := s3.New(sess)

	output, err := s3Client.ListBuckets(&s3.ListBucketsInput{})
	assert.NoError(t, err)

	bucket := FilterBuckets(output.Buckets, bucketName)
	if bucket == nil {
		t.Fatal("Could not find a bucket with name " + bucketName)
	}
}

// func TestTerraformBasicExampleWithPolicy(t *testing.T) {
// 	bucketName := "test-" + uuid.New().String()

// 	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
// 		TerraformDir: "../examples/basic-example",
// 		Vars: map[string]interface{}{
// 			"name": bucketName,
// 			"policy": fmt.Sprintf(`{
// "Version": "2012-10-17",
// "Statement": [
// {
// 	"Principal": "*",
// 	"Effect": "Allow",
// 	"Action": [
// 		"s3:PutObjectTagging"
// 	],
// 	"Resource": [
// 		"arn:aws:s3:::%s/*"
// 	],
// 	"Condition": {
// 		"ForAnyValue:StringEquals": {
// 			"s3:RequestObjectTagKeys": [
// 				"Horse"
// 			]
// 		}
// 	}
// }
// ]
// }`, bucketName),
// 		},
// 	})

// 	// defer terraform.Destroy(t, terraformOptions)

// 	terraform.InitAndApply(t, terraformOptions)

// 	sess, err := NewSession(os.Getenv("AWS_REGION"))
// 	assert.NoError(t, err)

// 	s3Client := s3.New(sess)

// 	output, err := s3Client.ListBuckets(&s3.ListBucketsInput{})
// 	assert.NoError(t, err)

// 	bucket := FilterBuckets(output.Buckets, bucketName)
// 	if bucket == nil {
// 		t.Fatal("Could not find a bucket with name " + bucketName)
// 	}
// }

func NewSession(region string) (*session.Session, error) {
	sess, err := TTAWS.NewAuthenticatedSession(region)
	if err != nil {
		return nil, err
	}

	return sess, nil
}

func FilterBuckets(buckets []*s3.Bucket, name string) *s3.Bucket {
	for _, currentBucket := range buckets {
		if aws.StringValue(currentBucket.Name) == name {
			return currentBucket
		}
	}

	return nil
}

func GetShortId() string {
	githubSha := os.Getenv("GITHUB_SHA")
	if len(githubSha) >= 7 {
		return githubSha[0:6]
	}

	return "local"
}
