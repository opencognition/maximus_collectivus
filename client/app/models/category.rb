class Category < ActiveResource::Base
  include ActiveResourceWithCas
  self.site = "https://service.maximus-collectivus.gov"
end