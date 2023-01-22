## 概要

Docker で bundle install したときに、エラーが出た。
それを解消するための実験

## 結論っぽい？

json でエラー。
native extention で必要なライブラリが足りてなさそう。

## エラー内容

```

[+] Building 11.7s (9/9) FINISHED
 => [internal] load build definition from Dockerfile.alpine                                                  0.0s
 => => transferring dockerfile: 179B                                                                         0.0s
 => [internal] load .dockerignore                                                                            0.0s
 => => transferring context: 2B                                                                              0.0s
 => [internal] load metadata for docker.io/library/ruby:2.7.7-alpine                                         1.6s
 => [internal] load build context                                                                            0.0s
 => => transferring context: 60B                                                                             0.0s
 => [1/5] FROM docker.io/library/ruby:2.7.7-alpine@sha256:b9b58c6bc64e31b0ffc6aa496ed155a53bee0e0eb9a4135c3  4.3s
 => => resolve docker.io/library/ruby:2.7.7-alpine@sha256:b9b58c6bc64e31b0ffc6aa496ed155a53bee0e0eb9a4135c3  0.0s
 => => sha256:1078410edf784733d0098510184aa7f97fab2a7f0ecc45261fc8608d0112e9c9 1.36kB / 1.36kB               0.0s
 => => sha256:15ec996d33196c45484ca29d4a4e2a796f7e9f5bf580e77edaa43c814597245b 6.28kB / 6.28kB               0.0s
 => => sha256:fe71bb0ecfee9a49c659caea9c562189308c32261544479dd7babb052d24a6e3 3.85MB / 3.85MB               0.7s
 => => sha256:134ec6373770556ccee80d88fc0a52d205074ceb254c4d68c04595025db9787b 223B / 223B                   0.5s
 => => sha256:590489e2c65e71d48bfb577d27974af13b933ee61a54499d9d0d05afb792db0e 14.29MB / 14.29MB             3.8s
 => => sha256:b9b58c6bc64e31b0ffc6aa496ed155a53bee0e0eb9a4135c35cb42c0eae79008 1.65kB / 1.65kB               0.0s
 => => sha256:a4a9351ddd5f5a64a6db1277503b33b7ac8e1ef2782aacf3e8a7a69448b69e8a 172B / 172B                   0.9s
 => => extracting sha256:fe71bb0ecfee9a49c659caea9c562189308c32261544479dd7babb052d24a6e3                    0.2s
 => => extracting sha256:134ec6373770556ccee80d88fc0a52d205074ceb254c4d68c04595025db9787b                    0.0s
 => => extracting sha256:590489e2c65e71d48bfb577d27974af13b933ee61a54499d9d0d05afb792db0e                    0.4s
 => => extracting sha256:a4a9351ddd5f5a64a6db1277503b33b7ac8e1ef2782aacf3e8a7a69448b69e8a                    0.0s
 => [2/5] WORKDIR /usr/src/app                                                                               0.1s
 => [3/5] COPY ./Gemfile /usr/src/app                                                                        0.0s
 => [4/5] COPY ./Gemfile.lock /usr/src/app                                                                   0.0s
 => ERROR [5/5] RUN bundle install                                                                           5.6s
------
 > [5/5] RUN bundle install:
#9 4.610 Fetching gem metadata from https://rubygems.org/.........
#9 5.068 Resolving dependencies...
#9 5.139 Fetching ast 2.4.2
#9 5.226 Installing ast 2.4.2
#9 5.238 Using bundler 2.1.4
#9 5.239 Fetching json 2.6.3
#9 5.363 Installing json 2.6.3 with native extensions
#9 5.499 Gem::Ext::BuildError: ERROR: Failed to build gem native extension.
#9 5.499
#9 5.499     current directory: /usr/local/bundle/gems/json-2.6.3/ext/json/ext/generator
#9 5.499 /usr/local/bin/ruby -I /usr/local/lib/ruby/2.7.0 -r
#9 5.499 ./siteconf20230122-1-fn4v79.rb extconf.rb
#9 5.499 creating Makefile
#9 5.499
#9 5.499 current directory: /usr/local/bundle/gems/json-2.6.3/ext/json/ext/generator
#9 5.499 make "DESTDIR=" clean
#9 5.499 sh: make: not found
#9 5.499
#9 5.499 current directory: /usr/local/bundle/gems/json-2.6.3/ext/json/ext/generator
#9 5.499 make "DESTDIR="
#9 5.499 sh: make: not found
#9 5.499
#9 5.499 make failed, exit code 127
#9 5.499
#9 5.499 Gem files will remain installed in /usr/local/bundle/gems/json-2.6.3 for
#9 5.499 inspection.
#9 5.499 Results logged to
#9 5.499 /usr/local/bundle/extensions/x86_64-linux-musl/2.7.0/json-2.6.3/gem_make.out
#9 5.499
#9 5.499 An error occurred while installing json (2.6.3), and Bundler cannot continue.
#9 5.499 Make sure that `gem install json -v '2.6.3' --source 'https://rubygems.org/'`
#9 5.499 succeeds before bundling.
#9 5.499
#9 5.499 In Gemfile:
#9 5.499   rubocop was resolved to 1.43.0, which depends on
#9 5.499     json
------
executor failed running [/bin/sh -c bundle install]: exit code: 5
```

