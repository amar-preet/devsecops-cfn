package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestSSHKey(t *testing.T) {
	t.Parallel()

	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	/*instanceSSHKey := strings.TrimSuffix(terraform.Output(t, terraformOptions, "instance_key"), "%")
	fmt.Print(instanceSSHKey)
	assert.Equal(t, "or", instanceSSHKey)

	instanceIP := strings.TrimSuffix(terraform.Output(t, terraformOptions, "instance_public_ip"), "%")
	instanceID := strings.TrimSuffix(terraform.Output(t, terraformOptions, "instance_id"), "%")
	instanceIPFromInstance := strings.TrimSuffix(aws.GetPublicIpOfEc2Instance(t, instanceID, "us-west-2"), "%")
	assert.Equal(t, instanceIP, instanceIPFromInstance)*/
}
