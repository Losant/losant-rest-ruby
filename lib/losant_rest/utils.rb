module LosantRest
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
