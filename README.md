### About

Small benchmarks for [Rails PR #28132](https://github.com/rails/rails/pull/28132).

#### Usage

```
bundle exec ruby benchmark.rb
```

#### Results

Results on my machine (Ubuntu 64-bit on a Intel(R) Core(TM) i7-6820HQ
CPU @ 2.70GHz)

```
$ bundle exec ruby benchmark.rb 
Size of HMAC signed message: 202
Size of HMAC CBC ciphertext: 306
Size of GCM ciphertext: 204

Warming up --------------------------------------
       HMAC generate     2.000  i/100ms
         HMAC verify     1.000  i/100ms
HMAC-CBC encrypt_and_sign
                         1.000  i/100ms
HMAC-CBC decrypt_and_verify
                         1.000  i/100ms
GCM encrypt_and_sign     1.000  i/100ms
GCM decrypt_and_verify
                         2.000  i/100ms
Calculating -------------------------------------
       HMAC generate     29.890  (± 3.3%) i/s -    150.000  in 5.028232s
         HMAC verify      9.510  (± 0.0%) i/s -     48.000  in 5.054287s
HMAC-CBC encrypt_and_sign
                         10.552  (± 0.0%) i/s -     53.000  in 5.034325s
HMAC-CBC decrypt_and_verify
                          6.208  (± 0.0%) i/s -     31.000  in 5.000673s
GCM encrypt_and_sign     19.984  (± 5.0%) i/s -    100.000  in 5.020456s
GCM decrypt_and_verify
                         24.547  (± 4.1%) i/s -    124.000  in 5.066601s

```

Your mileage may vary!
