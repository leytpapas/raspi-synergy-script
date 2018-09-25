# raspi-synergy-script
Instructions on installing synergy on raspberry pi 

As nothing else worked I went on with this approach

script.sh just follows the instructions written on [synergy's git](https://github.com/symless/synergy-core/wiki/Compiling-Legacy-v1.3.5-to-v1.8)

* Compile and run it using

```
chmod +x script.sh
./script.sh
```

* Then what is needed is to set

  **Boot Options -> Desktop/ CLI -> Desktop Autologin**

* Then of course have synergy server set up so that on every startup it connects

