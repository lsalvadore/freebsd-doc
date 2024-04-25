# Copyright (c) 2022 Lorenzo Salvadore <salvadore@FreeBSD.org>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

require 'optparse'

require 'Category.rb'

# ----------------------------------------------------------------------
# Parse arguments
# ----------------------------------------------------------------------

START               = ARGV[0]
STOP                = ARGV[1]
YEAR                = ARGV[2]
QUARTER             = ARGV[3]
TeamReports_FILES   = ARGV[4]
Projects_FILES      = ARGV[5]
Userland_FILES      = ARGV[6]
Kernel_FILES        = ARGV[7]
Architectures_FILES = ARGV[8]
Cloud_FILES         = ARGV[9]
Documentation_FILES = ARGV[10]
Ports_FILES         = ARGV[11]
ThirdParty_FILES    = ARGV[12]
Miscellaneous_FILES = ARGV[13]

# ----------------------------------------------------------------------
# Compute the right word for the quarter
# ----------------------------------------------------------------------

Quarter_Words = {
    "1"=>"First",
    "2"=>"Second",
    "3"=>"Third",
    "4"=>"Fourth"  }

QUARTER_WORD = Quarter_Words[QUARTER]

# ----------------------------------------------------------------------
# Initialize categories
# ----------------------------------------------------------------------

Categories = [

Category.new("FreeBSD-Team-Reports","FreeBSD Team Reports",
<<EOT,TeamReports_FILES.split),
{FreeBSD-Team-Reports-desc}
EOT

Category.new("projects","Projects",
<<EOT,Projects_FILES.split),
{projects-desc}
EOT

Category.new("userland","Userland",
<<EOT,Userland_FILES.split),
{userland-desc}
EOT

Category.new("kernel","Kernel",
<<EOT,Kernel_FILES.split),
{kernel-desc}
EOT

Category.new("architectures","Architectures",
<<EOT,Architectures_FILES.split),
{architectures-desc}
EOT

Category.new("cloud","Cloud",
<<EOT,Cloud_FILES.split),
{cloud-desc}
EOT

Category.new("documentation","Documentation",
<<EOT,Documentation_FILES.split),
{documentation-desc}
EOT

Category.new("ports","Ports",
<<EOT,Ports_FILES.split),
{ports-desc}
EOT

Category.new("third-Party-Projects","Third Party Projects",
<<EOT,ThirdParty_FILES.split),
{third-Party-Projects-desc}
EOT

Category.new("miscellaneous","Miscellaneous",
<<EOT,Miscellaneous_FILES.split)
{miscellaneous-desc}
EOT

    ]

# ----------------------------------------------------------------------
# Print report's header, introduction and ToC
# ----------------------------------------------------------------------

print <<EOT
---
title: "FreeBSD Status Report #{QUARTER_WORD} Quarter #{YEAR}"
sidenav: about
---

= Introduction
:doctype: article
:toc: macro
:toclevels: 2
:icons: font
:!sectnums:
:source-highlighter: rouge
:experimental:
:reports-path: content/en/status/report-#{YEAR}-#{sprintf("%02d",START)}-#{YEAR}-#{sprintf("%02d",STOP)}

include::content/en/status/categories-desc.adoc[]

include::{reports-path}/intro.adoc[]

'''

toc::[]
EOT

# ----------------------------------------------------------------------
# Print reports, by categories
# ----------------------------------------------------------------------

for x in Categories
    x.printAll
end
