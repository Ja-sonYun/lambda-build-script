# skip other resources, role configs

data archive_file "lambda_function" {
  type        = "zip"
  source_dir  = "./build/lambda_function/dist"
  output_path = "./build/lambda_function.zip"
}

resource "aws_lambda_function" "lambda_function" {
  handler          = "src/lambda_function.main"
  filename         = data.archive_file.lambda_function.output_path
  function_name    = "lambda_function"
  source_code_hash = data.archive_file.lambda_function.output_base64sha256
}
