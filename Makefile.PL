use ExtUtils::MakeMaker;
WriteMakefile(
     'NAME'          => 'ExtUtils::F77',
     'ABSTRACT'      => 'a simple interface to F77 libs',
     'AUTHOR'        => 'Karl Glazebrook <karlglazebrook@yahoo.com>',
     'LICENSE'       => 'perl_5',
     'VERSION_FROM'  => 'F77.pm',  
     PREREQ_PM => {
      'Text::ParseWords' => 0,
     },
     META_MERGE => {
       "meta-spec" => { version => 2 },
       resources => {
         repository => {
           type => 'git',
           url => 'git://github.com/PDLPorters/extutils-f77.git',
           web  => 'http://github.com/PDLPorters/extutils-f77',
         },
         x_IRC => 'irc://irc.perl.org/#pdl',
       },
     },
);
