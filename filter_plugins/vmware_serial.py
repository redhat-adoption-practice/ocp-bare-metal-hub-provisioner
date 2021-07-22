def string_to_segments(section):
    return_segments = []
    return_length = len(section) / 2
    index = 0
    while len(return_segments) < return_length:
        return_segments.append(section[index:index+2])
        index += 2
    return return_segments

def vmware_serial(vmware_uuid):
    uuid_sections = vmware_uuid.split('-')
    uuid_segments_front = []
    uuid_segments_back = []
    for index in range(0,3):
        for segment in string_to_segments(uuid_sections[index]):
            uuid_segments_front.append(segment)
    for index in range(3,5):
        for segment in string_to_segments(uuid_sections[index]):
            uuid_segments_back.append(segment)
    return "VMware-{0}-{1}".format(' '.join(uuid_segments_front), ' '.join(uuid_segments_back))
#    return "VMware-{0}-{1}".format('%20'.join(uuid_segments_front), '%20'.join(uuid_segments_back))

class FilterModule(object):
    def filters(self):
        return {"vmware_serial": vmware_serial}
