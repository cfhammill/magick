% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/color.R
\name{color}
\alias{color}
\alias{image_modulate}
\alias{image_quantize}
\alias{image_map}
\alias{image_channel}
\alias{image_separate}
\alias{image_combine}
\alias{image_transparent}
\alias{image_background}
\alias{image_colorize}
\alias{image_contrast}
\alias{image_normalize}
\alias{image_enhance}
\alias{image_equalize}
\alias{image_median}
\title{Image Color}
\usage{
image_modulate(image, brightness = 100, saturation = 100, hue = 100)

image_quantize(image, max = 256, colorspace = "rgb", dither = NULL,
  treedepth = NULL)

image_map(image, map, dither = FALSE)

image_channel(image, channel = "lightness")

image_separate(image, channel = "default")

image_combine(image, colorspace = "sRGB", channel = "default")

image_transparent(image, color, fuzz = 0)

image_background(image, color, flatten = TRUE)

image_colorize(image, opacity, color)

image_contrast(image, sharpen = 1)

image_normalize(image)

image_enhance(image)

image_equalize(image)

image_median(image, radius = 1)
}
\arguments{
\item{image}{magick image object returned by \code{\link[=image_read]{image_read()}} or \code{\link[=image_graph]{image_graph()}}}

\item{brightness}{modulation of brightness as percentage of the current value (100 for no change)}

\item{saturation}{modulation of saturation as percentage of the current value (100 for no change)}

\item{hue}{modulation of hue is an absolute rotation of -180 degrees to +180 degrees from the
current position corresponding to an argument range of 0 to 200 (100 for no change)}

\item{max}{preferred number of colors in the image. The actual number of colors in the image may
be less than your request, but never more.}

\item{colorspace}{string with a \href{https://www.imagemagick.org/Magick++/Enumerations.html#ColorspaceType}{colorspace}
from \link{colorspace_types} for example \code{"gray"}, \code{"rgb"} or \code{"cmyk"}}

\item{dither}{apply Floyd/Steinberg error diffusion to the image: averages intensities of several
neighboring pixels}

\item{treedepth}{depth of the quantization color classification tree. Values of 0 or 1 allow
selection of the optimal tree depth for the color reduction algorithm. Values between 2 and 8
may be used to manually adjust the tree depth.}

\item{map}{reference image to map colors from}

\item{channel}{a string with a
\href{https://www.imagemagick.org/Magick++/Enumerations.html#ChannelType}{channel} from
\link{channel_types} for example \code{"alpha"} or \code{"hue"} or \code{"cyan"}}

\item{color}{a valid \href{https://www.imagemagick.org/Magick++/Color.html}{color string} such as
\code{"navyblue"} or \code{"#000080"}. Use \code{"none"} for transparency.}

\item{fuzz}{relative color distance (value between 0 and 100) to be considered similar
in the filling algorithm}

\item{flatten}{should image be flattened before writing? This also replaces
transparency with background color.}

\item{opacity}{percentage of opacity used for coloring}

\item{sharpen}{enhance intensity differences in image}

\item{radius}{replace each pixel with the median color in a circular neighborhood}
}
\description{
Functions to adjust contrast, brightness, colors of the image. Details below.
}
\details{
For details see \href{https://www.imagemagick.org/Magick++/STL.html}{Magick++ STL}
documentation. Short descriptions:
\itemize{
\item \link{image_modulate} adjusts brightness, saturation and hue of image relative to current.
\item \link{image_quantize} reduces number of unique colors in the image.
\item \link{image_map} replaces colors of image with the closest color from a reference image.
\item \link{image_channel} extracts a single channel from an image and returns as grayscale.
\item \link{image_transparent} sets pixels approximately matching given color to transparent.
\item \link{image_background} sets background color. When image is flattened, transparent pixels get background color.
\item \link{image_colorize} overlays a solid color frame using specified opacity.
\item \link{image_contrast} enhances intensity differences in image
\item \link{image_normalize} increases contrast by normalizing the pixel values to span the full range of colors
\item \link{image_enhance} tries to minimize noise
\item \link{image_equalize} equalizes using histogram equalization
\item \link{image_median} replaces each pixel with the median color in a circular neighborhood
}

Note that
colors are also determined by image properties
\href{https://www.imagemagick.org/Magick++/Enumerations.html#ImageType}{imagetype} and
\href{https://www.imagemagick.org/Magick++/Enumerations.html#ColorspaceType}{colorspace}
which can be modified via \code{\link[=image_convert]{image_convert()}}.
}
\examples{
# manually adjust colors
logo <- image_read("logo:")
image_modulate(logo, brightness = 200)
image_modulate(logo, saturation = 150)
image_modulate(logo, hue = 200)

# Reduce image to 10 different colors using various spaces
image_quantize(logo, max = 10, colorspace = 'gray')
image_quantize(logo, max = 10, colorspace = 'rgb')
image_quantize(logo, max = 10, colorspace = 'cmyk')

# Change background color
translogo <- image_transparent(logo, 'white')
image_background(translogo, "pink", flatten = TRUE)

# Compare to flood-fill method:
image_fill(logo, "pink", fuzz = 20)

# Other color tweaks
image_colorize(logo, 50, "red")
image_contrast(logo)
image_normalize(logo)
image_enhance(logo)
image_equalize(logo)
image_median(logo)

# Alternate way to convert into black-white
image_convert(logo, type = 'grayscale')
}
\seealso{
Other image: \code{\link{_index_}}, \code{\link{analysis}},
  \code{\link{animation}}, \code{\link{attributes}},
  \code{\link{composite}}, \code{\link{device}},
  \code{\link{edges}}, \code{\link{editing}},
  \code{\link{effects}}, \code{\link{fx}},
  \code{\link{geometry}}, \code{\link{morphology}},
  \code{\link{ocr}}, \code{\link{options}},
  \code{\link{painting}}, \code{\link{segmentation}},
  \code{\link{transform}}, \code{\link{video}}
}
\concept{image}
