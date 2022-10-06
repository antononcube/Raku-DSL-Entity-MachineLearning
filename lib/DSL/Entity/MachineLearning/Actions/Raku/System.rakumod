use v6;

use DSL::Entity::MachineLearning::Grammar;
use DSL::Entity::MachineLearning::ResourceAccess;
use DSL::Shared::Actions::English::Raku::PipelineCommand;
use DSL::Shared::Entity::Actions::Raku::System;


class DSL::Entity::MachineLearning::Actions::Raku::System
        is DSL::Shared::Entity::Actions::Raku::System
        is DSL::Shared::Actions::English::Raku::PipelineCommand {

    has DSL::Entity::MachineLearning::ResourceAccess $.resources;

    ##========================================================
    ## Grammar methods
    ##========================================================

    method TOP($/) {
        make $/.values[0].made;
    }

    method classifier-property-entity-command($/) {
        make $/.values[0].made;
    }

    method entity-classifier-property-name($/) {
        my $nm = $!resources.name-to-entity-id('ClassifierProperty', $/.Str.lc, :!warn);
        make '"' ~ $nm ~ '"';
    }

    method classifier-entity-command($/) {
        make $/.values[0].made;
    }

    method entity-classifier-name($/) {
        my $nm = $!resources.name-to-entity-id('Classifier', $/.Str.lc, :!warn);
        make '"' ~ $nm ~ '"';
    }
}
