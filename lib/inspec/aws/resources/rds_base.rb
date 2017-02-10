# author: Kevin Formsma

class RDSBase < Inspec.resource(1)
  def initialize(id: nil, resource: nil, rds_resource: nil)
    if rds_resource.nil?
      @rds_resource = Aws::RDS::Resource.new
    else
      @rds_resource = rds_resource
    end
    @resource = get_rds_resource(id: id) unless id.nil?
    @resource = resource unless resource.nil?
    begin
      @resource.load
    rescue Aws::RDS::Errors::ServiceError => error
      skip_resource error
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

  def get_rds_resource(id:)
    fail NotImplementedError, 'RDS inspec resource must implement #get_rds_resource'
  end
end
