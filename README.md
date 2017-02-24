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

Rehearsal
---------------------------------------------------------------
HMAC generate                 0.040000   0.000000   0.040000 (0.040253)
HMAC verify                   0.110000   0.000000   0.110000 (0.115238)
HMAC-CBC encrypt_and_sign     0.100000   0.000000   0.100000 (0.100406)
HMAC-CBC decrypt_and_verify   0.170000   0.000000   0.170000 (0.171886)
GCM encrypt_and_sign          0.060000   0.000000   0.060000 (0.059925)
GCM decrypt_and_verify        0.050000   0.000000   0.050000 (0.046967)
------------------------------------------------------ total: 0.530000sec

                                  user     system      total        real
HMAC generate                 0.040000   0.000000   0.040000 (0.037547)
HMAC verify                   0.120000   0.000000   0.120000 (0.111730)
HMAC-CBC encrypt_and_sign     0.100000   0.000000   0.100000 (0.096689)
HMAC-CBC decrypt_and_verify   0.170000   0.000000   0.170000 (0.165184)
GCM encrypt_and_sign          0.050000   0.000000   0.050000 (0.055885)
GCM decrypt_and_verify        0.050000   0.000000   0.050000 (0.046961)
```

Your mileage may vary!
