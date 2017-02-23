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
Size of HMAC CBC ciphertext: 306
Size of HMAC CBC ciphertext: 204

Rehearsal
---------------------------------------------------------------
HMAC-CBC encrypt_and_sign     0.090000   0.000000   0.090000 (0.090278)
HMAC-CBC decrypt_and_verify   0.150000   0.000000   0.150000 (0.146913)
GCM encrypt_and_sign          0.040000   0.000000   0.040000 (0.045625)
GCM decrypt_and_verify        0.040000   0.000000   0.040000 (0.039777)
------------------------------------------------------ total: 0.320000sec

                                  user     system      total        real
HMAC-CBC encrypt_and_sign     0.080000   0.000000   0.080000 (0.083409)
HMAC-CBC decrypt_and_verify   0.140000   0.000000   0.140000 (0.144830)
GCM encrypt_and_sign          0.040000   0.000000   0.040000 (0.045266)
GCM decrypt_and_verify        0.040000   0.000000   0.040000 (0.037759)
```

Your mileage may vary!
