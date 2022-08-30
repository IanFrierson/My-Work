using System;
using System.ComponentModel.DataAnnotations;

namespace Sabio.Models.Requests.Friends
{
    public class FriendAddRequest
    {
        [Required]
        [MinLength(2)]
        public string Title { get; set; }

        [Required]
        [MinLength(2)]
        public string Bio { get; set; }

        [Required]
        [MinLength(2)]
        public string Summary { get; set; }

        [Required]
        [MinLength(2)]
        public string Headline { get; set; }

        [Required]
        [MinLength(2)]
        public string Slug { get; set; }

        [Required]
        [Range(1, int.MaxValue, ErrorMessage = "Only positive number allowed")]
        public int StatusId { get; set; }

        [Required]
        public string PrimaryImageUrl { get; set; }

      






    }
}
