using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace wServer.networking
{
    public class RC4
    {
        private const int STATE_LENGTH = 256;

        private byte[] engineState;
        private int x;
        private int y;
        private byte[] workingKey;

        public RC4(byte[] key)
        {
            workingKey = key;
            SetKey(workingKey);
        }

        public void Crypt(byte[] packet, int offset, int len)
        {
            ProcessBytes(packet, len, offset);
        }

        public void Reset()
        {
            SetKey(workingKey);
        }

        private void ProcessBytes(byte[] input, int length, int offset)
        {
            unsafe
            {
                // pin both, the engine state and input
                // to local fixed buffers
                fixed (byte* engine = engineState, pointer = input)
                {

                    byte* ptr = (pointer + offset);

                    // create local copies of the x,y states
                    // because accessing locals is faster
                    int x = this.x;
                    int y = this.y;

                    // reverse loop is faster because the length needs to be read only once
                    for (int i = length; i > 0; i--)
                    {

                        // optimized operations
                        // removed unnecessary array accesses
                        // eliminated array bounds checking

                        byte xState = engine[x = (x + 1) & 0xff];
                        byte yState = engine[y = (xState + y) & 0xff];

                        engine[x] = yState;
                        engine[y] = xState;

                        *ptr ^= engine[(yState + xState) & 0xff];

                        // point to the next index
                        ptr++;
                    }

                    // return the state
                    this.x = x;
                    this.y = y;
                }
            }
        }


        private void SetKey(byte[] keyBytes)
        {
            workingKey = keyBytes;
            x = y = 0;

            if (engineState == null)
                engineState = new byte[STATE_LENGTH];

            for (int i = 0; i < STATE_LENGTH; i++)
                engineState[i] = (byte)i;

            int i1 = 0, i2 = 0;

            for (int i = 0; i < STATE_LENGTH; i++)
            {
                i2 = ((keyBytes[i1] & 0xff) + engineState[i] + i2) & 0xff;
                byte tmp = engineState[i];
                engineState[i] = engineState[i2];
                engineState[i2] = tmp;
                i1 = (i1 + 1) % keyBytes.Length;
            }
        }
    }
}