namespace REPORT_MANAGEMENT_APP.Models
{
    public class FileMetadataModel : MetadataModel
    {
        public string Module { get; set; }
        public string SubModule { get; set; }
        public string ModuleName { get; set; } = string.Empty;
        public string SubModuleName { get; set; }
        public string ModuleDisplay => Module + StringUtilities.DASH + ModuleName;
        public string SubModuleDisplay => SubModule + StringUtilities.DASH + SubModuleName;

    }
}
