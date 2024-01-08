using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace REPORT_MANAGEMENT_APP.Models
{
    public class ReportDetailModel : FileMetadataModel
    {
        private string GetHash(string input)
        {
            SHA256 sha256Hash = SHA256.Create();
            // Convert the input string to a byte array and compute the hash.
            byte[] data = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            var sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString(0, 8);
        }

        public string AgencyName { get; set; }
        public string AgencyCode { get; set; }
        public string AgencyDepartment { get; set; }
        public string FileDepartment { get; set; }
        public string FileDescription { get; set; }
        public string FileName { get; set; }
        public string FileTokenKey { get; set; }
        public Guid FileId { get; set; }
        public string QuarterMonth { get; set; }
        public string FolderPath { get; set; }
        public string FilePath { get; set; }
        public DateTime? LastModified { get; set; }
        public string HashTokenKey => GetHash(FileTokenKey ?? string.Empty);
        public string Extension => Path.GetExtension(FilePath ?? string.Empty);
    }

}
