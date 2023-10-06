# The MIT License (MIT)
#
# Copyright (c) 2023 Losant IoT, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

module PlatformRest
  class Utils
    def self.symbolize_hash_keys(hash)
      Hash[hash.dup.map { |k, v| [k.to_sym, v] }]
    end

    def self.fix_query_arrays(value)
      if value.respond_to?(:to_ary)
        value = value.to_ary.map.with_index.to_a.to_h.invert
      end

      if value.respond_to?(:to_hash)
        value = value.to_hash
        value.each do |k, v|
          value[k] = fix_query_arrays(v)
        end
      end

      value
    end
  end
end
