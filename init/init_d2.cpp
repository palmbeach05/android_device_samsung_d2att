/*
   Copyright (c) 2017, The Linux Foundation. All rights reserved.

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

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}
void set_target_properties(const char *device, const char *model, const char *descr, const char *fingerprint)
{
    property_override("ro.product.device", device);
    property_override("ro.product.model", model);
    property_override("ro.build.product", device);
    property_override("ro.build.description", descr);
    property_override("ro.build.fingerprint", fingerprint);
}

void vendor_load_properties()
{
    char bootloader[PROP_VALUE_MAX];
    property_get("ro.bootloader", bootloader);

    /* d2can (Canada Variants) */
    if (strstr(bootloader, "I747M") != NULL) {
        set_target_properties(
            "d2can", 
            "SGH-I747M", 
            "d2can-user 4.4.2 KOT49H I747MVLUFND2 release-keys", 
            "samsung/d2can/d2can:4.4.2/KOT49H/I747MVLUFND2:user/release-keys"
        );
    }
    /* d2tmo (T-Mobile) */
    else if (strstr(bootloader, "T999") != NULL) {
        set_target_properties(
            "d2tmo", 
            "SGH-T999", 
            "d2tmo-user 4.4.2 KOT49H T999UVUENC2 release-keys", 
            "samsung/d2tmo/d2tmo:4.4.2/KOT49H/T999UVUENC2:user/release-keys"
        );
    }
    /* Fallback Default: d2att (AT&T) */
    else {
        set_target_properties(
            "d2att", 
            "SAMSUNG-SGH-I747", 
            "d2uc-user 4.4.2 KOT49H I747UCUFNJ2 release-keys", 
            "samsung/d2uc/d2att:4.4.2/KOT49H/I747UCUFNJ2:user/release-keys"
        );
    }
}
