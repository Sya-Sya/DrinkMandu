using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace template.infrastructure.Library
{
    public static class Extension
    {
        public static byte[] FromBase64ToBytes(this string item)
        {
            try
            {
                var convertedByte = Convert.FromBase64String(item);
                return convertedByte;
            }
            catch
            {
                return null;
            }
        }

        public static string FromBytesToString(this byte[] bytes)
        {
            if (bytes == null)
                return null;
            else
                return Encoding.UTF8.GetString(bytes);
        }
    }
}