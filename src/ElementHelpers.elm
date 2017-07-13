module ElementHelpers exposing (image, styleMap)

import Element
import Element.Internal.Model exposing (Element(..), Attribute(..), mapChildren)


image : String -> style -> List (Attribute variation msg) -> Element style variation msg -> Element style variation msg
image path =
    Element.image ("/assets/" ++ path)


styleMap : (style -> parent) -> (variation -> parentVariation) -> Element style variation msg -> Element parent parentVariation msg
styleMap toParent toParentVariation el =
    case el of
        Empty ->
            Empty

        Spacer f ->
            Spacer f

        Text dec str ->
            Text dec str

        Element ({ style, attrs, child, absolutelyPositioned } as elm) ->
            Element
                { elm
                    | style = Maybe.map toParent style
                    , child = styleMap toParent toParentVariation child
                    , absolutelyPositioned =
                        Maybe.map (List.map (styleMap toParent toParentVariation)) absolutelyPositioned
                    , attrs = List.map (mapVariation toParentVariation) attrs
                }

        Layout ({ style, attrs, children, absolutelyPositioned } as elm) ->
            Layout
                { elm
                    | style = Maybe.map toParent style
                    , children = mapChildren (styleMap toParent toParentVariation) children
                    , absolutelyPositioned =
                        Maybe.map (List.map (styleMap toParent toParentVariation)) absolutelyPositioned
                    , attrs = List.map (mapVariation toParentVariation) attrs
                }

        Raw html ->
            Raw html


mapVariation : (variation -> parentVariation) -> Attribute variation msg -> Attribute parentVariation msg
mapVariation fn attr =
    case attr of
        Event htmlAttr ->
            Event htmlAttr

        InputEvent htmlAttr ->
            InputEvent htmlAttr

        Attr htmlAttr ->
            Attr htmlAttr

        Vary v b ->
            Vary (fn v) b

        Height len ->
            Height len

        Width len ->
            Width len

        Inline ->
            Inline

        HAlign align ->
            HAlign align

        VAlign align ->
            VAlign align

        Position x y z ->
            Position x y z

        PositionFrame fr ->
            PositionFrame fr

        Hidden ->
            Hidden

        Opacity o ->
            Opacity o

        Spacing x y ->
            Spacing x y

        Margin m ->
            Margin m

        Expand ->
            Expand

        Padding t r b l ->
            Padding t r b l

        PhantomPadding x ->
            PhantomPadding x

        GridArea str ->
            GridArea str

        GridCoords pos ->
            GridCoords pos

        PointerEvents on ->
            PointerEvents on

        Shrink i ->
            Shrink i

        Overflow x ->
            Overflow x
