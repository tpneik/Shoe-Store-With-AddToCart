using System.ComponentModel.DataAnnotations;

namespace asp1.Models
{
    public class Article
    {
        public int ArticleId { get; set; }
        [Required]
        [StringLength(300)]
        public string? Title { get; set; }
        [Required]
        [StringLength(30000)]
        public string? Content { get; set; }
        [Required]
        [StringLength(100)]
        public string? Pulished { get; set; }
    }
}
