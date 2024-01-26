require 'aws-sdk-route53'

client = Aws::Route53::Client.new

pp client.create_hosted_zone({
  name: "example.com",
  caller_reference: "Nonce"
})
