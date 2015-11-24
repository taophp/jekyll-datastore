#	See:: http://stackoverflow.com/questions/6672244/convert-ruby-string-to-nix-filename-compatible-string
def friendly_filename(filename)
    filename.gsub(/[^\w\s_-]+/, '')
            .gsub(/(^|\b\s)\s+($|\s?\b)/, '\\1\\2')
            .gsub(/\s+/, '_')
end
