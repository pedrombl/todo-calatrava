# A sample Guardfile
# More info at https://github.com/guard/guard#readme

notification 'terminal-notifier'

guard 'rake', :task => 'web:build' do
	watch(%r{.*\.coffee})
	watch(%r{.*\.haml})
end

