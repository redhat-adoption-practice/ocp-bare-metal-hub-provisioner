def string_to_segments(section):
    return_segments = []
    return_length = len(section) / 2
    index = 0
    while len(return_segments) < return_length:
        return_segments.append(section[index:index+2])
        index += 2
    return return_segments

def vmware_datastore(datastore_path):
    path_sections = datastore_path.split(' ')
    datastore_name = path_sections[0].replace('[','').replace(']','')
    return datastore_name

def vmware_folder_path(datastore_path):
    path_sections = datastore_path.split(' ')
    file_path = path_sections[1]
    folder = '/'.join(file_path.split('/')[:-1])
    return folder

def vmware_file_name(datastore_path):
    path_sections = datastore_path.split(' ')
    file_path = path_sections[1]
    file_name = file_path.split('/')[-1]
    return file_name

class FilterModule(object):
    def filters(self):
        return {
                "vmware_datastore": vmware_datastore,
                "vmware_folder_path": vmware_folder_path,
                "vmware_file_name": vmware_file_name
                }
