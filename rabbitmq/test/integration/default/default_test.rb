# InSpec test for recipe postgresql::default
#
#
# # The InSpec reference, with examples and extensive documentation, can be
# # found at https://www.inspec.io/docs/reference/resources/
#
#
unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
           end

unless os.windows?
  # Rbbitmq users is required for application to run.
  describe user('rabbitmqt'), :skip do
    it { should exist }
  end
     end
# RabbimtMQ  web console must run on SSL port 15671.
describe port(15671), :skip do
  it { should be_listening }
end
# RabbimtMQ  daemon consol must run on SSL port 5671.
describe port(5671), :skip do
  it { should be_listening }
end

# RabitMQ desired version must be installed.
describe package('rabbitmq-server') do
  it { should be_installed }
  its('version') { should eq '3.7.14-1.el7' }
end

# Esl-erlang version must be latest i.e 22.x
describe package('esl-erlang') do
  it { should be_installed }
  its('version') { should eq '22.3-1' }
end

# RabbitMQ service should be enabaled and running.
describe service('rabbitmq-server') do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end
