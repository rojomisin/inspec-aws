# author: Kevin Formsma

class TaggableS3Base < S3Base
  def has_tag?(tag_key = nil, value = nil)
    tags = @resource.tag_set
    # s3tags = Aws::S3::BucketTagging.new(bucket_name: 'buckethalffull')
    # s3tags.tag_set
    # s3tagset.each do |y|
    #   puts y
    # end
    return tags.size > 0 if tag_key.nil?
    tags.each do |tag|
      if tag.key == tag_key
        return value.nil? || tag.value == value
      end
    end
    false
  end
end
