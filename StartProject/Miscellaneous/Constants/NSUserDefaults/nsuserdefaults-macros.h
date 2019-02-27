// Copyright (c) 2012, Matthias Hochgatterer <matthias.hochgatterer@gmail.com>
//
// Permission to use, copy, modify, and/or distribute this software for any
// purpose with or without fee is hereby granted, provided that the above
// copyright notice and this permission notice appear in all copies.
//
// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

#define defaults()                          [NSUserDefaults standardUserDefaults]
#define defaults_init(dictionary)           [defaults() registerDefaults:dictionary]
#define defaults_save()                     [defaults() synchronize]
#define defaults_object(key)                [defaults() objectForKey:key]
#define defaults_bool(key)                  [defaults() boolForKey:key]
#define defaults_integer(key)               [defaults() integerForKey:key]
#define defaults_float(key)                 [defaults() floatForKey:key]
#define defaults_set_object(key, object)    [defaults() setObject:object forKey:key]; defaults_save(); defaults_post_notification(key)
#define defaults_set_bool(key, bool)        [defaults() setBool:bool forKey:key]; defaults_save(); defaults_post_notification(key)
#define defaults_set_integer(key, integer)  [defaults() setInteger:integer forKey:key]; defaults_save(); defaults_post_notification(key)
#define defaults_set_float(key, bool)       [defaults() setFloat:bool forKey:key]; defaults_save(); defaults_post_notification(key)
#define defaults_remove(key)                [defaults() removeObjectForKey:key]

#define defaults_object_from_notification(n) n.userInfo
#define defaults_observe_object(key, block) [[NSNotificationCenter defaultCenter] addObserverForName:key object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *n) { block( defaults_object_from_notification(n) ); }]
#define defaults_post_notification(defaults_key) [[NSNotificationCenter defaultCenter] postNotificationName:defaults_key object:nil userInfo:nil]
#define defaults_post_notification_with_dic(defaults_key, dic) [[NSNotificationCenter defaultCenter] postNotificationName:defaults_key object:nil userInfo:dic]
