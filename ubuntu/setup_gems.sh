echo -e '\n\n\nSetting up rubygems'
sudo gem sources --add http://gems.github.com

echo -e '\n\n= Rails'
sudo gem install rake rails --no-rdoc --no-ri

echo -e '\n\n= Xml, Xslt'
sudo gem install libxml-ruby libxslt-ruby builder

echo -e '\n\n= Misc'
sudo gem install daemons json rmagick sqlite3-ruby fastthread rack mime-types shared-mime-info

echo -e '\n\n= MySQL'
sudo gem install mysql

echo -e '\n\n= Ferret'
sudo gem install ferret

echo -e '\n\n= Testing'
sudo gem install thoughtbot-shoulda

echo -e '\n\n= SCM'\
sudo gem install capistrano


echo -e '\n\n= Custom'
echo -e '\n== I18n'
sudo gem install whatlanguage
echo -e '\n== Strings'
sudo gem install stemmer







