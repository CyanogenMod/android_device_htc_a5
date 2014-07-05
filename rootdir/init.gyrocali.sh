#!/system/bin/sh
# Copyright (c) 2009-2010, Code Aurora Forum. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Code Aurora nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

#set gyro permissions
chown system.input /dev/input/event0
chown system.input /dev/input/event1
chown system.input /dev/input/event2
chown system.input /dev/input/event3
chown system.input /dev/input/event4
chown system.input /dev/input/event5
chown system.input /dev/input/event6
chown system.input /dev/input/event7
chown system.input /dev/input/event8
chown system.input /dev/input/event9
chown system.input /dev/input/event10
chown system.input /dev/input/event11
chown system.input /dev/input/event12
chown system.input /dev/input/event13
chmod 0660 /dev/input/event0
chmod 0660 /dev/input/event1
chmod 0660 /dev/input/event2
chmod 0660 /dev/input/event3
chmod 0660 /dev/input/event4
chmod 0660 /dev/input/event5
chmod 0660 /dev/input/event6
chmod 0660 /dev/input/event7
chmod 0660 /dev/input/event8
chmod 0660 /dev/input/event9
chmod 0660 /dev/input/event10
chmod 0660 /dev/input/event11
chmod 0660 /dev/input/event12
chmod 0660 /dev/input/event13
