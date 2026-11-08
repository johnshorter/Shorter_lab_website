require 'liquid'

module Jekyll
  module AuthorFilters
    # normalize a name for matching: lowercase, drop dots/commas, collapse spaces
    def self.normalize(name)
      return name.to_s.downcase.gsub(/[.,]/, " ").gsub(/\s+/, " ").strip
    end

    # spellings of a member name as they show up in author lists, e.g.
    # "John R. Shorter" -> john r shorter, john shorter, j r shorter, jr shorter
    def self.variants(name)
      parts = normalize(name).split(" ")
      return [] if parts.empty?
      return [parts[0]] if parts.length == 1
      surname = parts[-1]
      given = parts[0..-2]
      initials = given.map { |g| g[0] }
      return [
        parts.join(" "),
        [given[0], surname].join(" "),
        (initials + [surname]).join(" "),
        [initials.join(""), surname].join(" "),
      ].uniq
    end

    # set of normalized spellings for every member (current and alumni)
    def self.member_keys(site)
      keys = {}
      members = site.collections["members"]
      (members ? members.docs : []).each do |doc|
        names = [doc.data["name"]] + Array(doc.data["aliases"])
        names.compact.each do |name|
          variants(name).each { |v| keys[v] = true }
        end
      end
      return keys
    end

    # bold lab members in an author list, and when the list is long (more than
    # 2 * keep), show the first and last `keep` authors plus every member, with
    # "..." in each gap. returns an array of markdown strings.
    def highlight_authors(authors, keep = 5)
      authors = Array(authors).map { |a| a.to_s.strip }.reject(&:empty?)
      keep = keep.to_i
      site = @context.registers[:site]
      keys = AuthorFilters.member_keys(site)

      is_member = authors.map { |a| keys.key?(AuthorFilters.normalize(a)) }

      shown = authors.each_index.select do |i|
        authors.length <= keep * 2 ||
          i < keep ||
          i >= authors.length - keep ||
          is_member[i]
      end

      result = []
      previous = -1
      shown.each do |i|
        result << "..." if i > previous + 1
        result << (is_member[i] ? "**#{authors[i]}**" : authors[i])
        previous = i
      end
      return result
    end
  end
end

Liquid::Template.register_filter(Jekyll::AuthorFilters)
