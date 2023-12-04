#!/usr/bin/perl
use strict;
use warnings;
use RPi::PIGPIO ':all';
use Time::HiRes;

my @gpio = (
    2,  4, 15, 21, 25, 8,  5,  19, 16, 17, 27, 26,
    24, 9, 12, 6,  29, 19, 14, 18, 11, 7,  23, 22
);

my $pi = RPi::PIGPIO->connect('localhost');
init_pins();

while ('true') {

    simple_cycle();

}

sub init_pins {

    for my $i ( 0 .. $#gpio ) {

        $pi->set_mode( $gpio[$i], PI_OUTPUT );

    }

}

sub simple_cycle {

    for my $i ( 0 .. $#gpio ) {

        $pi->write_pwm( $gpio[$i], int rand(255) );
        sleep(0.125);

    }

}

