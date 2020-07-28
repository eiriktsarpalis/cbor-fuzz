using System;
using System.IO;

namespace System.Formats.Cbor.Tests
{
    class Fuzzer
    {
        static void Main(string[] args)
        {
            if (args.Length == 0)
            {
                throw new ArgumentException("No CBOR file specified.");
            }

            string file = args[0];
            byte[] content = File.ReadAllBytes(file);
            var reader = new CborReader(content, CborConformanceMode.Lax, allowMultipleRootLevelValues: true);
            try
            {
                while (reader.PeekState() != CborReaderState.Finished)
                {
                    reader.SkipValue();
                }
            }
            catch (CborContentException)
            {

            }
        }
    }
}
