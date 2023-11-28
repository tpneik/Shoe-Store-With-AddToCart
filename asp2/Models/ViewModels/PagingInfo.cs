namespace asp2.Models.ViewModels
{
    public class PagingInfo
    {
        public int  TotalItem { get; set; }
        public int ItemPerPage { get; set; }
        public int CurrentPage { get; set; }
        public int TotalPages => (int)Math.Ceiling((double)TotalItem / ItemPerPage);
    }
}
