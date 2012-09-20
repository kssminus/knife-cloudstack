#
# Author:: 
# Copyright:: Copyright (c) 2011 Edmunds, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/knife'

module KnifeCloudstack
  class CsProductList < Chef::Knife

    deps do
      require 'knife-cloudstack/connection'
    end

    banner "knife cs product list (options)"

    def run

      connection = CloudstackClient::Connection.new(
          locate_config_value(:cloudstack_url),
          locate_config_value(:cloudstack_api_key),
          locate_config_value(:cloudstack_secret_key)
      )

      product_list = [
          ui.color('id', :bold),
          ui.color('serviceid', :bold),
          ui.color('desc', :bold),
          ui.color('diskid', :bold),
          ui.color('desc', :bold),
          ui.color('templateid', :bold),
          ui.color('desc', :bold),
          ui.color('zoneid', :bold),
          ui.color('desc', :bold)
      ]
      products = connection.list_products
      products.each do |product| 
          product_list << product['productid']
          product_list << product['serviceofferingid']
          product_list << product['serviceofferingdesc']
          product_list << product['diskofferingid']
          product_list << product['diskofferingdesc']
          product_list << product['templateid']
          product_list << product['templatedesc']
          product_list << product['zoneid']
          product_list << product['zonedesc']
      end
      #puts ui.list(product_list, :columns_across, 9)
      puts products.to_json
    end

    def locate_config_value(key)
      key = key.to_sym
      Chef::Config[:knife][key] || config[key]
    end

  end
end
