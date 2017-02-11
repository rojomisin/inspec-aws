# author: Kevin Formsma

class S3Bucket < TaggableS3Base
  name 'aws_s3_bucket'
  desc 'Use the aws-s3-bucket resource to test AWS EC2 Instances.'
  example "
    describe aws-s3-bucket(bucket_name: 'db-123456') do
      it { should have_tag('Name').with_value('VPC Name') }
    end
  "

  def get_s3_resource(bucket_name:)
    @s3_resource.s3_bucket(id)
  end

  # def security_groups
  #   @resource.security_groups.map { |sg| SecurityGroup.new(id: sg.group_id, ec2_resource: @ec2_resource) }
  # end
  #
  # def subnet
  #   Subnet.new(resource: @resource.subnet, ec2_resource: @ec2_resource)
  # end
  #
  # def vpc
  #   Vpc.new(resource: @resource.vpc, ec2_resource: @ec2_resource)
  # end

  def to_s
    "S3Bucket #{@resource.id}"
  end
end
