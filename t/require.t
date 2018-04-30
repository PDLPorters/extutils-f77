use strict;
use warnings;
use Test::More tests => 2;

use_ok 'ExtUtils::F77';
$ExtUtils::F77::Runtime = $ExtUtils::F77::Runtime; # silence warning

open(FH,">hello.f");
print FH "
      subroutine hello_fortran
      print *, 'Hello from the wonderful world of fortran'
c     $ExtUtils::F77::Compiler $ExtUtils::F77::Cflags $ExtUtils::F77::Runtime
      return
      end
";

close FH;
unlink "hello.o" if(-e "hello.o");
my $compile_command = "$ExtUtils::F77::Compiler  $ExtUtils::F77::Cflags -c hello.f ";
my $rc = system($compile_command);
$rc = 0xffff & $rc;
if($rc){
  if($rc == 0xff00){
	 fail "ERROR: $compile_command failed: $!";
  }elsif ($rc > 0x80) {
	 $rc >>= 8;
	 fail "WARNING: $compile_command returned non-zero exit status $rc\n";
  }else{
	 if($rc & 0x80){
		fail "$compile_command coredumped from signal $rc";
	 }else{
		fail "$compile_command returned signal $rc";
	 }
  }  
}else{
  unlink "hello.f","hello.o";
  pass;
}

# how about linking - too complicated? 
