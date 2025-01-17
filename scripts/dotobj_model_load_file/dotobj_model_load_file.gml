/// Loads an ASCII .obj file from disk and turns it into a vertex buffer
/// @jujuadams
/// 
/// .obj format documentation can be found here:
/// http://paulbourke.net/dataformats/obj/
/// 
/// This script expects the vertex format to be setup as follows:
/// - 3D Position
/// - Normal
/// - Colour
/// - Texture Coordinate
/// If a model has missing data, then a suitable default value will be used instead
/// 
/// The .obj format does not natively support vertex colours; vertex colours will
/// default to white and 100% alpha. If you use a custom exporter that supports
/// vertex colours (such as MeshLab or MeshMixer) then vertex colours will be
/// respected in the final vertex buffer.
/// 
/// Texture coordinates for a .obj model will typically be normalised and in the
/// range (0,0) -> (1,1). Please use another script to remap texture coordinates
/// to GameMaker's atlased UV space.
/// 
/// @param filename      File to read from
/// @param flipUVs       Whether to flip the y-axis (V-component) of the texture coordinates. This is useful to correct for DirectX / OpenGL idiosyncrasies
/// @param reverseTris   Whether to reverse the triangle definition order to be compatible with the culling mode of your choice (clockwise/counter-clockwise)
/// 
/// Returns: A dotobj model (a struct)
///          This model can be drawn using the submit() method e.g. sponza_model.submit();

function dotobj_model_load_file(_filename, _flip_texcoords, _reverse_triangles)
{
    var _buffer = buffer_load(_filename);
    var _result = dotobj_model_load(_buffer, _flip_texcoords, _reverse_triangles);
    buffer_delete(_buffer);

    return _result;
}