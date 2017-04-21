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
Size of HMAC signed message: 226
Size of HMAC CBC ciphertext: 306
Size of GCM ciphertext: 204

Warming up --------------------------------------
  HMAC SHA1 generate     2.000  i/100ms
    HMAC SHA1 verify     1.000  i/100ms
HMAC SHA256 generate     2.000  i/100ms
  HMAC SHA256 verify     1.000  i/100ms
HMAC-CBC encrypt_and_sign
                         1.000  i/100ms
HMAC-CBC decrypt_and_verify
                         1.000  i/100ms
GCM encrypt_and_sign     2.000  i/100ms
GCM decrypt_and_verify
                         2.000  i/100ms
Calculating -------------------------------------
  HMAC SHA1 generate     27.972  (± 3.6%) i/s -    140.000  in 5.010023s
    HMAC SHA1 verify      7.838  (± 0.0%) i/s -     40.000  in 5.105001s
HMAC SHA256 generate     28.358  (± 3.5%) i/s -    142.000  in 5.010496s
  HMAC SHA256 verify      7.826  (± 0.0%) i/s -     40.000  in 5.112862s
HMAC-CBC encrypt_and_sign
                         11.405  (± 0.0%) i/s -     57.000  in 5.003066s
HMAC-CBC decrypt_and_verify
                          6.801  (± 0.0%) i/s -     34.000  in 5.000964s
GCM encrypt_and_sign     21.319  (± 4.7%) i/s -    108.000  in 5.069550s
GCM decrypt_and_verify
                         25.694  (± 3.9%) i/s -    130.000  in 5.065517s

```

Your mileage may vary!
