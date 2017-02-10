# author: Kevin Formsma

class DBInstance < TaggableRDSBase
  name 'aws_rds_instance'
  desc 'Use the aws-rds-instance resource to test AWS EC2 Instances.'
  example "
    describe aws-rds-instance(id: 'db-123456') do
      it { should have_tag('Name').with_value('VPC Name') }
    end
  "

  def get_rds_resource(id:)
    @rds_resource.db_instance(id)
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
    "DBInstance #{@resource.id}"
  end
end
