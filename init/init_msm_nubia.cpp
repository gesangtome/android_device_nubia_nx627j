/*
   Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <sys/sysinfo.h>
#include <android-base/properties.h>
#include "property_service.h"
#include "vendor_init.h"
#include "init_msm_nubia.h"

using android::base::GetProperty;
using android::init::property_set;

/* Initialize new string variables */
const std::string finger;
const std::string desc;
const std::string v_finger;

void checking_device_Identifier()
{
    /* Assigning a null character variable */
    GetProperty(system_fingerprint, finger);
    GetProperty(system_description, desc);
    GetProperty(vendor_fingerprint, v_finger);

    /* Set to the fingerprint of the vendor If not equal*/
    if (finger != finger_sys) {
        property_set(system_fingerprint, finger_sys);
    }
    /* Set to the description of the vendor If not equal*/
    if (desc != desc_sys) {
        property_set(system_description, desc_sys);
    }
    /* vendor fingerprint == system fingerprint, Direct assignment */
    if (v_finger != finger_sys) {
        property_set(vendor_fingerprint, finger_sys);
    }
}

void vendor_load_properties()
{
    /* Call: checking_device_Identifier */
    checking_device_Identifier();
}
