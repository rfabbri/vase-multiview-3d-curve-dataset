# Vase Multiview 3D Curve Dataset

This real curve 3D groundtruth is constructed by manually deleting points of a
dense point cloud obtained from structured lighting. 

Figures and explanations of this ground truth are provided in:
http://Multiview-3d-Drawing.sf.net

Using the point cloud alone, the 3D edges are not identifiable with confidence.
Therefore, we reproject the dense point cloud scan onto reference images during
editing for disam biguating edges. The unstructured point cloud from structured
lighting tends to suffer from oversmoothing, and lacks structure near edges,
which we recover from the reference images registered using the ground truth
camera parameters.


## Files

```
images/   a subset of the images for scene 40 from DTU robot feature dataset,
    which are originally 3GB in high res. This is what we had selected for the
    Multiview-3d-Drawing.sf.net system, if you want to compare against it.

cameras/  a subset of the cameras provided by the massive DTU robot feature dataset. These are 
    text files containing 3x4 matrix entries for each image in images/

3d/original   the original mesh files 

3d/registered-editing.blend

3d/full/*.ply
  
3d/full/*.txt.bz2

3d/gt-points.txt  x y z coordinates for sample points, one point per line.
                  lets call this the 'allpts' nx3 array
```

## Images
The images are from the DTU Robot Feature Dataset, set 40, high res version
http://roboimagedata.imm.dtu.dk/data/tar1200x1600/SET037_42.tar.gz
They are in the folder SET040.

## Generating your own registered images in Blender for image-aligned 3D editing

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
