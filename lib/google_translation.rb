require 'json'
require 'faraday'
require 'faraday_middleware'

class Translate < Hash
  
  BASE = 'https://www.googleapis.com'
  PATH = '/language/translate/v2/'
  AGENT = 'Mini-Goolge-Translate-Client'
  
  attr_accessor :user_agent
  
  # Require key at initialization
  #
  # @param [string] key | Goolge API key
  def initialize(key)
    self['key']     = key
    self.user_agent = AGENT
  end
  
  # Method for tranlating 
  #
  # @param [options] 
  # @option options [string] :source language to translate from
  # @option options [string] :target language to translate to
  # @option options [string] :q      string to be translated
  def translate(options={})
    self.call('', options)
  end
  
  # Method for disocvering supported languages
  def discover()
    self.call('languages', {})
  end
    
  # Method for dectecting language of text input
  #
  # @param [string] text language to interpret
  def detect(text)
    self.call('detect', q: text.to_str)
  end
    
  # Set URL and make request
  #
  # @param [string] path file path for service
  # @param [hash] options hash to convert into query
  def call(path, options)
    self.url(path, options)
    resp = self.conn.get
    JSON.parse(resp.body)
  end
  
  # Build Faraday connection for HTTP request  
  def conn
    Faraday.new(:url => @url) do |c|
      c.adapter Faraday.default_adapter
      c.headers['User-Agent'] = self.user_agent
      c.params = self
    end
  end
  
  # Assemble URL and query params
  #
  # @param [string] path path file path for service
  # @param [hash] options hash to convert into query
  def url(path, options)
    self.merge!(options) unless options.empty?
    @url = BASE + PATH + path
  end
end