import subprocess
import json

def run_aws_s3_command(command):
    try:
        # Running the AWS CLI command
        result = subprocess.run(command, capture_output=True, text=True, check=True)
        # Printing the output
        print("Command output:")
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        # If an error occurs
        print("Error running command:", e)
        print("Error output:")
        print(e.stderr)

def list_s3_buckets():
    command = ["aws", "s3", "ls"]
    run_aws_s3_command(command)

def main():
    # Example: Listing all S3 buckets
    list_s3_buckets()

if __name__ == "__main__":
    main()
