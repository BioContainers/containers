from ..biotools import load_record
from ..GraphicRecord import GraphicRecord
from ..CircularGraphicRecord import CircularGraphicRecord
from ..GraphicFeature import GraphicFeature


class BiopythonTranslatorBase:
    """Base class for all BiopythonTranslators.

    This class needs to be complemented with methods compute_feature_label,
    compute_features_color, etc. to be usable. See BiopythonTranslator for
    an example of minimal working subclass.

    Parameters
    ----------

    features_filters
      List of filters (some_biopython_feature) => True/False.
      Only features passing all the filters are kept.
      This only works if you haven't redefined ``compute_filtered_features``

    features_properties
      A function (feature)=> properties_dict.
    """

    graphic_record_parameters = {}

    def __init__(self, features_filters=(), features_properties=None):
        self.features_filters = features_filters
        self.features_properties = features_properties

    def translate_feature(self, feature):
        """Translate a Biopython feature into a Dna Features Viewer feature."""
        properties = dict(
            label=self.compute_feature_label(feature),
            color=self.compute_feature_color(feature),
            html=self.compute_feature_html(feature),
            fontdict=self.compute_feature_fontdict(feature),
            box_linewidth=self.compute_feature_box_linewidth(feature),
            box_color=self.compute_feature_box_color(feature),
            linewidth=self.compute_feature_linewidth(feature),
            label_link_color=self.compute_feature_label_link_color(feature),
            legend_text=self.compute_feature_legend_text(feature),
        )
        if self.features_properties is not None:
            other_properties = self.features_properties
            if hasattr(other_properties, "__call__"):
                other_properties = other_properties(feature)
            properties.update(other_properties)

        return GraphicFeature(
            start=feature.location.start,
            end=feature.location.end,
            strand=feature.location.strand,
            **properties
        )

    def translate_record(self, record, record_class=None, filetype=None):
        """Create a new GraphicRecord from a BioPython Record object.

        Parameters
        ----------

        record
          A BioPython Record object or the path to a Genbank or a GFF file.

        record_class
          The graphic record class to use, e.g. GraphicRecord (default) or
          CircularGraphicRecord. Strings 'circular' and 'linear' can also be
          provided.

        filetype
          Used only when a Genbank or a GFF file is provided; one of "genbank"
          or "gff" to be used. Default None infers from file extension.
        """
        classes = {
            "linear": GraphicRecord,
            "circular": CircularGraphicRecord,
            None: GraphicRecord,
        }
        if record_class in classes:
            record_class = classes[record_class]

        if isinstance(record, str) or hasattr(record, "read"):
            record = load_record(record, filetype=filetype)
        filtered_features = self.compute_filtered_features(record.features)
        return record_class(
            sequence_length=len(record),
            sequence=str(record.seq) if record.seq else None,
            features=[
                self.translate_feature(feature)
                for feature in filtered_features
                if feature.location is not None
            ],
            **self.graphic_record_parameters
        )

    @classmethod
    def quick_class_plot(cls, record, figure_width=12, **kwargs):
        """Allows super quick and dirty plotting of Biopython records.

        This is really meant for use in a Jupyter/Ipython notebook with
        the "%matplotlib inline" setting.

        >>> from dna_features_viewer import BiopythonTranslator
        >>> BiopythonTranslator.quick_plot(my_record)
        """
        graphic_record = cls().translate_record(record)
        ax, _ = graphic_record.plot(figure_width=figure_width, **kwargs)
        return ax

    def quick_plot(self, record, figure_width=12, **kwargs):
        """Allows super quick and dirty plotting of Biopython records.

        This is really meant for use in a Jupyter/Ipython notebook with
        the "%matplotlib inline" setting.

        >>> from dna_features_viewer import BiopythonTranslator
        >>> BiopythonTranslator.quick_plot(my_record)
        """
        graphic_record = self.translate_record(record)
        ax, _ = graphic_record.plot(figure_width=figure_width, **kwargs)
        return ax
