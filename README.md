# Vase Multiview 3D Curve Dataset

This real curve 3D groundtruth is constructed by manually deleting points of a
dense point cloud obtained from structured lighting. 

Figures and explanations of this ground truth are provided in:
http://Multiview-3d-Drawing.sf.net

Using the point cloud alone, the 3D edges are not identifiable with confidence.
Therefore, we reproject the dense point cloud scan onto reference images during
editing for disambiguating edges. The unstructured point cloud from structured
lighting tends to suffer from oversmoothing, and lacks structure near edges,
which we recover from the reference images registered using the ground truth
camera parameters.


## Files

```
vase-edge-gt3-017.txt.gz   the ground truth 3D scan points at feature edges.
    obtained by manually deleting homogeneous areas from the full scan.
    The file contains x y z coordinates for sample points, one point per line,
    as an nx3 array. Loat into matlab with the load function (uncompress first)


pts-40.ply.gz   the original scan points to be opened in meshlab. Uncompress it
    first.

vase-edge-gt3-017.blend   open this in Blender to see how the image-registered 
    editing was done (explained below).

images/   a subset of the images for scene 40 from DTU robot feature dataset,
    which are originally 3GB in high res. This is what we had selected for the
    Multiview-3d-Drawing.sf.net system, if you want to compare against it.

cameras/  a subset of the cameras provided by the DTU robot feature dataset. These are 
    text files containing 3x4 matrix entries for each image in images/
```
## Images
The images are from the DTU Robot Feature Dataset, set 40, high res version
http://roboimagedata.imm.dtu.dk/data/tar1200x1600/SET037_42.tar.gz
They are in the folder SET040.

## Generating your own registered images in Blender for image-aligned 3D editing

### How it was done for the present dataset

After opening the provided vase-edge-gt3-017.blend, there will be several
windows. I use these windows on a multi-monitor setup, one per monitor.
Right-click on a black point cloud to make it yellow (selected). You will see
the full scan registered to the images (yes, there is camera information). You
can edit the point cloud from any view and it will update on all the others.
Notice how the original scan has outliers, but it has a good subset we use for
manual editing. To see the final edge ground truth, you can go to the window
which has a hiearchy of objects displayed on the top-right corner. Click on
pts-40 (then possibly right-click the black points) to show the edited ground
truth near curves. Click on pts-orig (then possibly right-click the black
points) to show the original scan again. You can see these black point clounds
more clearly on the same window that has the object hierarchy, on a view right
to the left of it, where we display the point cloud together with the reference
cameras (Figure 8 from the full supplementary materials PDF).  If you want to
experiment registered editing, select any view you wish to edit from (you can
edit from the image views or the 3D view simultaneously).  Then press tab to go
into Edit Mode. Press 'a' until the point cloud is black/unselected. Then type
'c' for circle selection, and click on a region of the scan to be deleted. You
will see the regions selected on all windows and in the 3D view at the same
time. Check carefully if what you selected really is a homogeneous region on all
images. If so, then type 'Esc' then 'x' to delete (select Delete->Vertices on
the popup window).  Do not rotate the image views otherwise they will get
unregistered.


### Doing it for a different dataset

You will have to know how to load images and a camera model into blender and create views
which are registered to the images.

Ask [Ric Fabbri](http://rfabbri.github.io) for further details.


## Version

Dataset produced and tested with Blender 2.76 on Mac OSX and Linux.

## Authors

[Ricardo Fabbri](http://rfabbri.github.io) built the dataset.
Further authors include Anil Usumezbas and Benjamin Kimia.

## Credits

This dataset was built on top of DTU Robot Point Feature dataset,
[DTU Robot Image Datasets](http://roboimagedata.compute.dtu.dk), scene 40.
Please cite them when citing this dataset.

We also acknowledge FAPERJ/Brazil and NSF support.


## Citing the dataset

Please cite the dataset as

```bibtex
@inproceedings{Usumezbas:Fabbri:Kimia:ECCV16,
    Author         = {Anil Usumezbas and Ricardo Fabbri and Benjamin B. Kimia},
    Booktitle      = {Proceedings of the European Conference on Computer Vision},
    Crossref       = {ECCV2016},
    Title          = {From multiview image curves to {3D} drawings},
    Year           = {2016}
}

@proceedings{ECCV2016,
  title     = {Computer Vision - ECCV 2016, 14th European Conference on
               Computer Vision, Amsterdam, Netherlands, October 8-16,
               2016, Proceedings},
  booktitle = {14th European Conference on
               Computer Vision, Amsterdam, Netherlands, October 8-16,
               2016},
  publisher = {Springer},
  series    = {Lecture Notes in Computer Science},
  year      = {2016}
}
```

Also remember to cite the DTU IJCV paper listed on their website.

## Links

[DTU Robot Image Datasets](http://roboimagedata.compute.dtu.dk), from which this dataset derives

Blender demo files that can serve as ground truth
https://www.blender.org/download/demo-files

Ric Fabbri's posts on how to convert to/from Blender cameras to standard 3x4
format for your own projects with blender
* http://blender.stackexchange.com/questions/38009/3x4-camera-matrix-from-blender-camera
* http://blender.stackexchange.com/questions/40650/blender-camera-from-3x4-matrix

Figures and explanations of this ground truth are provided in:
http://Multiview-3d-Drawing.sf.net
