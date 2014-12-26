build:
	docker build -t build-ruby:1.9.3-p551 .
	docker run -v /src/build_ruby:/src -v /src/output:/output build-ruby:1.9.3-p551

clean:
	rm -f /output/ruby-1.9.3.rpm

package: clean
	fpm -t rpm \
	--verbose \
	-s dir \
	-p /output/ruby-1.9.3.rpm \
	--after-install ./build_scripts/create_symlinks.sh \
	--pre-uninstall ./build_scripts/remove_symlinks.sh \
	--version 1.9.3 \
	--iteration 551 \
	-n "ruby-1.9.3" \
	/usr/local/ruby-1.9.3
