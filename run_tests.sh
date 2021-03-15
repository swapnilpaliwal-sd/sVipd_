echo "======================================="
echo "=========     Step 1 of 2     ========="
echo "========= Running RSpec Tests ========="
echo "======================================="
bundle exec rspec

echo "======================================="
echo "=========     Step 2 of 2     ========="
echo "=========  Running Cucumber   ========="
echo "======================================="
rake db:test:prepare
rake cucumber
