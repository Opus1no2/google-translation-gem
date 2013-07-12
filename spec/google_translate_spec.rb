# encoding: utf-8

require File.join(File.dirname(__FILE__), '..', 'lib', 'google_translation')

describe Translate do 

  before(:each) do 
    @eng = 'I am a sentence composed of the english language'
    @translate = Translate.new('YOUR API KEY')
  end  
  
  it "should translate text" do
    result = @translate.translate(:source => 'en', :target => 'de', :q => @eng)
    result.should == {"data"=>{"translations"=>[{"translatedText"=>"Ich bin ein Satz Englisch Sprache verfasst"}]}}
    
    result = @translate.translate(:source => 'en', :target => 'fr', :q => @eng)
    result.should == {"data"=>{"translations"=>[{"translatedText"=>"Je suis une phrase composée de la langue anglaise"}]}}
    
    result = @translate.translate(:source => 'en', :target => 'ga', :q => @eng)
    result.should == {"data"=>{"translations"=>[{"translatedText"=>"Tá mé abairt comhdhéanta de na teanga Béarla"}]}}
  end
  
  it "should discover languages" do 
    result = @translate.discover()
    result.should == {"data"=>{"languages"=>[{"language"=>"af"}, {"language"=>"ar"}, {"language"=>"be"}, {"language"=>"bg"}, {"language"=>"ca"}, {"language"=>"cs"}, {"language"=>"cy"}, {"language"=>"da"}, {"language"=>"de"}, {"language"=>"el"}, {"language"=>"en"}, {"language"=>"eo"}, {"language"=>"es"}, {"language"=>"et"}, {"language"=>"fa"}, {"language"=>"fi"}, {"language"=>"fr"}, {"language"=>"ga"}, {"language"=>"gl"}, {"language"=>"hi"}, {"language"=>"hr"}, {"language"=>"ht"}, {"language"=>"hu"}, {"language"=>"id"}, {"language"=>"is"}, {"language"=>"it"}, {"language"=>"iw"}, {"language"=>"ja"}, {"language"=>"ko"}, {"language"=>"lt"}, {"language"=>"lv"}, {"language"=>"mk"}, {"language"=>"ms"}, {"language"=>"mt"}, {"language"=>"nl"}, {"language"=>"no"}, {"language"=>"pl"}, {"language"=>"pt"}, {"language"=>"ro"}, {"language"=>"ru"}, {"language"=>"sk"}, {"language"=>"sl"}, {"language"=>"sq"}, {"language"=>"sr"}, {"language"=>"sv"}, {"language"=>"sw"}, {"language"=>"th"}, {"language"=>"tl"}, {"language"=>"tr"}, {"language"=>"uk"}, {"language"=>"vi"}, {"language"=>"yi"}, {"language"=>"zh"}, {"language"=>"zh-TW"}]}}
  end
  
  it "should detect languages" do 
    result = @translate.detect(@eng)
    result.should == {"data"=>{"detections"=>[[{"language"=>"en", "isReliable"=>false, "confidence"=>0.08031229}]]}}
  end 
end