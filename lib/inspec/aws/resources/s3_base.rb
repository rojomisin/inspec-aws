# author: Kevin Formsma

class S3Base < Inspec.resource(1)
  def initialize(bucket_name: nil, resource: nil, s3_resource: nil)
    if s3_resource.nil?
      @s3_resource = Aws::S3::BucketTagging.new(bucket_name: bucket_name)
    else
      @s3_resource = s3_resource
    end
    # @resource = get_s3_resource(bucket_name: bucket_name) unless bucket_name.nil?
    @resource = get_s3_resource() unless bucket_name.nil?
    @resource = resource # unless resource.nil
    begin
      # @resource.load
      @resource
    rescue Aws::S3::Errors::ServiceError => error
      # skip_resource error
    end
  end

  def method_missing(symbol, *args)
    if @resource.respond_to?(symbol)
      @resource.send(symbol)
    else
      super(symbol, args)
    end
  end

  private

  def get_s3_resource()
    fail NotImplementedError, 'S3 inspec resource must implement #get_s3_resource'
  end
end
